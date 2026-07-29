# Explore: explore_0598
# Auto-generated LookML Explore File

include: "/views/domain_45/view_01795.view.lkml"
include: "/views/domain_47/view_01797.view.lkml"
include: "/views/domain_48/view_01798.view.lkml"
include: "/views/domain_49/view_01799.view.lkml"

explore: explore_0598 {
  label: "Explore Explore 0598"
  description: "Comprehensive analytics explore joining base view_01795 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01795
  
  always_filter: {
    filters: [view_01795.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01795.created_at_date: "7 days"]
    unless: [view_01795.id, view_01795.status]
  }

  join: view_01797 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01795.user_id} = ${view_01797.id} ;;
    required_joins: []
  }

  join: view_01798 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01795.account_id} = ${view_01798.account_id} ;;
    required_joins: [view_01797]
  }

  join: view_01799 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01795.category} = ${view_01799.category} ;;
  }

  access_filter: {
    field: view_01795.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01795.is_deleted} = false ;;
}
