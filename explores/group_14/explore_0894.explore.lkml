# Explore: explore_0894
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02683.view.lkml"
include: "/views/domain_35/view_02685.view.lkml"
include: "/views/domain_36/view_02686.view.lkml"
include: "/views/domain_37/view_02687.view.lkml"

explore: explore_0894 {
  label: "Explore Explore 0894"
  description: "Comprehensive analytics explore joining base view_02683 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02683
  
  always_filter: {
    filters: [view_02683.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02683.created_at_date: "7 days"]
    unless: [view_02683.id, view_02683.status]
  }

  join: view_02685 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02683.user_id} = ${view_02685.id} ;;
    required_joins: []
  }

  join: view_02686 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02683.account_id} = ${view_02686.account_id} ;;
    required_joins: [view_02685]
  }

  join: view_02687 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02683.category} = ${view_02687.category} ;;
  }

  access_filter: {
    field: view_02683.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02683.is_deleted} = false ;;
}
