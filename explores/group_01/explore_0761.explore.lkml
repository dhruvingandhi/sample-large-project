# Explore: explore_0761
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02284.view.lkml"
include: "/views/domain_36/view_02286.view.lkml"
include: "/views/domain_37/view_02287.view.lkml"
include: "/views/domain_38/view_02288.view.lkml"

explore: explore_0761 {
  label: "Explore Explore 0761"
  description: "Comprehensive analytics explore joining base view_02284 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02284
  
  always_filter: {
    filters: [view_02284.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02284.created_at_date: "7 days"]
    unless: [view_02284.id, view_02284.status]
  }

  join: view_02286 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02284.user_id} = ${view_02286.id} ;;
    required_joins: []
  }

  join: view_02287 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02284.account_id} = ${view_02287.account_id} ;;
    required_joins: [view_02286]
  }

  join: view_02288 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02284.category} = ${view_02288.category} ;;
  }

  access_filter: {
    field: view_02284.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02284.is_deleted} = false ;;
}
