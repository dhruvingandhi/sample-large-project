# Explore: explore_2598
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07795.view.lkml"
include: "/views/domain_47/view_07797.view.lkml"
include: "/views/domain_48/view_07798.view.lkml"
include: "/views/domain_49/view_07799.view.lkml"

explore: explore_2598 {
  label: "Explore Explore 2598"
  description: "Comprehensive analytics explore joining base view_07795 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07795
  
  always_filter: {
    filters: [view_07795.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07795.created_at_date: "7 days"]
    unless: [view_07795.id, view_07795.status]
  }

  join: view_07797 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07795.user_id} = ${view_07797.id} ;;
    required_joins: []
  }

  join: view_07798 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07795.account_id} = ${view_07798.account_id} ;;
    required_joins: [view_07797]
  }

  join: view_07799 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07795.category} = ${view_07799.category} ;;
  }

  access_filter: {
    field: view_07795.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07795.is_deleted} = false ;;
}
