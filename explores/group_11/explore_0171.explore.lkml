# Explore: explore_0171
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00514.view.lkml"
include: "/views/domain_16/view_00516.view.lkml"
include: "/views/domain_17/view_00517.view.lkml"
include: "/views/domain_18/view_00518.view.lkml"

explore: explore_0171 {
  label: "Explore Explore 0171"
  description: "Comprehensive analytics explore joining base view_00514 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00514
  
  always_filter: {
    filters: [view_00514.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00514.created_at_date: "7 days"]
    unless: [view_00514.id, view_00514.status]
  }

  join: view_00516 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00514.user_id} = ${view_00516.id} ;;
    required_joins: []
  }

  join: view_00517 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00514.account_id} = ${view_00517.account_id} ;;
    required_joins: [view_00516]
  }

  join: view_00518 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00514.category} = ${view_00518.category} ;;
  }

  access_filter: {
    field: view_00514.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00514.is_deleted} = false ;;
}
