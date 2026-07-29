# Explore: explore_0992
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02977.view.lkml"
include: "/views/domain_29/view_02979.view.lkml"
include: "/views/domain_30/view_02980.view.lkml"
include: "/views/domain_31/view_02981.view.lkml"

explore: explore_0992 {
  label: "Explore Explore 0992"
  description: "Comprehensive analytics explore joining base view_02977 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02977
  
  always_filter: {
    filters: [view_02977.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02977.created_at_date: "7 days"]
    unless: [view_02977.id, view_02977.status]
  }

  join: view_02979 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02977.user_id} = ${view_02979.id} ;;
    required_joins: []
  }

  join: view_02980 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02977.account_id} = ${view_02980.account_id} ;;
    required_joins: [view_02979]
  }

  join: view_02981 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02977.category} = ${view_02981.category} ;;
  }

  access_filter: {
    field: view_02977.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02977.is_deleted} = false ;;
}
