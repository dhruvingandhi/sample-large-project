# Explore: explore_1171
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03514.view.lkml"
include: "/views/domain_16/view_03516.view.lkml"
include: "/views/domain_17/view_03517.view.lkml"
include: "/views/domain_18/view_03518.view.lkml"

explore: explore_1171 {
  label: "Explore Explore 1171"
  description: "Comprehensive analytics explore joining base view_03514 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03514
  
  always_filter: {
    filters: [view_03514.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03514.created_at_date: "7 days"]
    unless: [view_03514.id, view_03514.status]
  }

  join: view_03516 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03514.user_id} = ${view_03516.id} ;;
    required_joins: []
  }

  join: view_03517 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03514.account_id} = ${view_03517.account_id} ;;
    required_joins: [view_03516]
  }

  join: view_03518 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03514.category} = ${view_03518.category} ;;
  }

  access_filter: {
    field: view_03514.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03514.is_deleted} = false ;;
}
