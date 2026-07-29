# Explore: explore_3453
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10360.view.lkml"
include: "/views/domain_12/view_10362.view.lkml"
include: "/views/domain_13/view_10363.view.lkml"
include: "/views/domain_14/view_10364.view.lkml"

explore: explore_3453 {
  label: "Explore Explore 3453"
  description: "Comprehensive analytics explore joining base view_10360 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10360
  
  always_filter: {
    filters: [view_10360.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10360.created_at_date: "7 days"]
    unless: [view_10360.id, view_10360.status]
  }

  join: view_10362 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10360.user_id} = ${view_10362.id} ;;
    required_joins: []
  }

  join: view_10363 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10360.account_id} = ${view_10363.account_id} ;;
    required_joins: [view_10362]
  }

  join: view_10364 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10360.category} = ${view_10364.category} ;;
  }

  access_filter: {
    field: view_10360.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10360.is_deleted} = false ;;
}
