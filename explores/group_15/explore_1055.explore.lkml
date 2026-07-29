# Explore: explore_1055
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03166.view.lkml"
include: "/views/domain_18/view_03168.view.lkml"
include: "/views/domain_19/view_03169.view.lkml"
include: "/views/domain_20/view_03170.view.lkml"

explore: explore_1055 {
  label: "Explore Explore 1055"
  description: "Comprehensive analytics explore joining base view_03166 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03166
  
  always_filter: {
    filters: [view_03166.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03166.created_at_date: "7 days"]
    unless: [view_03166.id, view_03166.status]
  }

  join: view_03168 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03166.user_id} = ${view_03168.id} ;;
    required_joins: []
  }

  join: view_03169 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03166.account_id} = ${view_03169.account_id} ;;
    required_joins: [view_03168]
  }

  join: view_03170 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03166.category} = ${view_03170.category} ;;
  }

  access_filter: {
    field: view_03166.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03166.is_deleted} = false ;;
}
