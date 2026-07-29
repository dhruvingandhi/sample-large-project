# Explore: explore_1414
# Auto-generated LookML Explore File

include: "/views/domain_43/view_04243.view.lkml"
include: "/views/domain_45/view_04245.view.lkml"
include: "/views/domain_46/view_04246.view.lkml"
include: "/views/domain_47/view_04247.view.lkml"

explore: explore_1414 {
  label: "Explore Explore 1414"
  description: "Comprehensive analytics explore joining base view_04243 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04243
  
  always_filter: {
    filters: [view_04243.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04243.created_at_date: "7 days"]
    unless: [view_04243.id, view_04243.status]
  }

  join: view_04245 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04243.user_id} = ${view_04245.id} ;;
    required_joins: []
  }

  join: view_04246 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04243.account_id} = ${view_04246.account_id} ;;
    required_joins: [view_04245]
  }

  join: view_04247 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04243.category} = ${view_04247.category} ;;
  }

  access_filter: {
    field: view_04243.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04243.is_deleted} = false ;;
}
