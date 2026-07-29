# Explore: explore_0414
# Auto-generated LookML Explore File

include: "/views/domain_43/view_01243.view.lkml"
include: "/views/domain_45/view_01245.view.lkml"
include: "/views/domain_46/view_01246.view.lkml"
include: "/views/domain_47/view_01247.view.lkml"

explore: explore_0414 {
  label: "Explore Explore 0414"
  description: "Comprehensive analytics explore joining base view_01243 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01243
  
  always_filter: {
    filters: [view_01243.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01243.created_at_date: "7 days"]
    unless: [view_01243.id, view_01243.status]
  }

  join: view_01245 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01243.user_id} = ${view_01245.id} ;;
    required_joins: []
  }

  join: view_01246 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01243.account_id} = ${view_01246.account_id} ;;
    required_joins: [view_01245]
  }

  join: view_01247 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01243.category} = ${view_01247.category} ;;
  }

  access_filter: {
    field: view_01243.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01243.is_deleted} = false ;;
}
