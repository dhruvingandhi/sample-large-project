# Explore: explore_0364
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01093.view.lkml"
include: "/views/domain_45/view_01095.view.lkml"
include: "/views/domain_46/view_01096.view.lkml"
include: "/views/domain_47/view_01097.view.lkml"

explore: explore_0364 {
  label: "Explore Explore 0364"
  description: "Comprehensive analytics explore joining base view_01093 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_01093
  
  always_filter: {
    filters: [view_01093.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01093.created_at_date: "7 days"]
    unless: [view_01093.id, view_01093.status]
  }

  join: view_01095 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01093.user_id} = ${view_01095.id} ;;
    required_joins: []
  }

  join: view_01096 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01093.account_id} = ${view_01096.account_id} ;;
    required_joins: [view_01095]
  }

  join: view_01097 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01093.category} = ${view_01097.category} ;;
  }

  access_filter: {
    field: view_01093.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01093.is_deleted} = false ;;
}
