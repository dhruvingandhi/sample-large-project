# Explore: explore_1992
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05977.view.lkml"
include: "/views/domain_29/view_05979.view.lkml"
include: "/views/domain_30/view_05980.view.lkml"
include: "/views/domain_31/view_05981.view.lkml"

explore: explore_1992 {
  label: "Explore Explore 1992"
  description: "Comprehensive analytics explore joining base view_05977 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05977
  
  always_filter: {
    filters: [view_05977.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05977.created_at_date: "7 days"]
    unless: [view_05977.id, view_05977.status]
  }

  join: view_05979 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05977.user_id} = ${view_05979.id} ;;
    required_joins: []
  }

  join: view_05980 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05977.account_id} = ${view_05980.account_id} ;;
    required_joins: [view_05979]
  }

  join: view_05981 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05977.category} = ${view_05981.category} ;;
  }

  access_filter: {
    field: view_05977.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05977.is_deleted} = false ;;
}
