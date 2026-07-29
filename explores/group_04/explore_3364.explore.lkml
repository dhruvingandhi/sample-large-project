# Explore: explore_3364
# Auto-generated LookML Explore File

include: "/views/domain_43/view_10093.view.lkml"
include: "/views/domain_45/view_10095.view.lkml"
include: "/views/domain_46/view_10096.view.lkml"
include: "/views/domain_47/view_10097.view.lkml"

explore: explore_3364 {
  label: "Explore Explore 3364"
  description: "Comprehensive analytics explore joining base view_10093 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10093
  
  always_filter: {
    filters: [view_10093.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10093.created_at_date: "7 days"]
    unless: [view_10093.id, view_10093.status]
  }

  join: view_10095 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10093.user_id} = ${view_10095.id} ;;
    required_joins: []
  }

  join: view_10096 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10093.account_id} = ${view_10096.account_id} ;;
    required_joins: [view_10095]
  }

  join: view_10097 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10093.category} = ${view_10097.category} ;;
  }

  access_filter: {
    field: view_10093.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10093.is_deleted} = false ;;
}
