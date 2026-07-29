# Explore: explore_1058
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03175.view.lkml"
include: "/views/domain_27/view_03177.view.lkml"
include: "/views/domain_28/view_03178.view.lkml"
include: "/views/domain_29/view_03179.view.lkml"

explore: explore_1058 {
  label: "Explore Explore 1058"
  description: "Comprehensive analytics explore joining base view_03175 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03175
  
  always_filter: {
    filters: [view_03175.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03175.created_at_date: "7 days"]
    unless: [view_03175.id, view_03175.status]
  }

  join: view_03177 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03175.user_id} = ${view_03177.id} ;;
    required_joins: []
  }

  join: view_03178 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03175.account_id} = ${view_03178.account_id} ;;
    required_joins: [view_03177]
  }

  join: view_03179 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03175.category} = ${view_03179.category} ;;
  }

  access_filter: {
    field: view_03175.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03175.is_deleted} = false ;;
}
