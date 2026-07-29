# Explore: explore_2992
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08977.view.lkml"
include: "/views/domain_29/view_08979.view.lkml"
include: "/views/domain_30/view_08980.view.lkml"
include: "/views/domain_31/view_08981.view.lkml"

explore: explore_2992 {
  label: "Explore Explore 2992"
  description: "Comprehensive analytics explore joining base view_08977 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08977
  
  always_filter: {
    filters: [view_08977.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08977.created_at_date: "7 days"]
    unless: [view_08977.id, view_08977.status]
  }

  join: view_08979 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08977.user_id} = ${view_08979.id} ;;
    required_joins: []
  }

  join: view_08980 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08977.account_id} = ${view_08980.account_id} ;;
    required_joins: [view_08979]
  }

  join: view_08981 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08977.category} = ${view_08981.category} ;;
  }

  access_filter: {
    field: view_08977.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08977.is_deleted} = false ;;
}
