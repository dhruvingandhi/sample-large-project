# Explore: explore_1953
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05860.view.lkml"
include: "/views/domain_12/view_05862.view.lkml"
include: "/views/domain_13/view_05863.view.lkml"
include: "/views/domain_14/view_05864.view.lkml"

explore: explore_1953 {
  label: "Explore Explore 1953"
  description: "Comprehensive analytics explore joining base view_05860 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05860
  
  always_filter: {
    filters: [view_05860.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05860.created_at_date: "7 days"]
    unless: [view_05860.id, view_05860.status]
  }

  join: view_05862 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05860.user_id} = ${view_05862.id} ;;
    required_joins: []
  }

  join: view_05863 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05860.account_id} = ${view_05863.account_id} ;;
    required_joins: [view_05862]
  }

  join: view_05864 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05860.category} = ${view_05864.category} ;;
  }

  access_filter: {
    field: view_05860.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05860.is_deleted} = false ;;
}
