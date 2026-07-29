# Explore: explore_3598
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10795.view.lkml"
include: "/views/domain_47/view_10797.view.lkml"
include: "/views/domain_48/view_10798.view.lkml"
include: "/views/domain_49/view_10799.view.lkml"

explore: explore_3598 {
  label: "Explore Explore 3598"
  description: "Comprehensive analytics explore joining base view_10795 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10795
  
  always_filter: {
    filters: [view_10795.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10795.created_at_date: "7 days"]
    unless: [view_10795.id, view_10795.status]
  }

  join: view_10797 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10795.user_id} = ${view_10797.id} ;;
    required_joins: []
  }

  join: view_10798 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10795.account_id} = ${view_10798.account_id} ;;
    required_joins: [view_10797]
  }

  join: view_10799 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10795.category} = ${view_10799.category} ;;
  }

  access_filter: {
    field: view_10795.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10795.is_deleted} = false ;;
}
