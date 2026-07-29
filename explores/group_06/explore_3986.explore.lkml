# Explore: explore_3986
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11959.view.lkml"
include: "/views/domain_11/view_11961.view.lkml"
include: "/views/domain_12/view_11962.view.lkml"
include: "/views/domain_13/view_11963.view.lkml"

explore: explore_3986 {
  label: "Explore Explore 3986"
  description: "Comprehensive analytics explore joining base view_11959 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11959
  
  always_filter: {
    filters: [view_11959.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11959.created_at_date: "7 days"]
    unless: [view_11959.id, view_11959.status]
  }

  join: view_11961 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11959.user_id} = ${view_11961.id} ;;
    required_joins: []
  }

  join: view_11962 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11959.account_id} = ${view_11962.account_id} ;;
    required_joins: [view_11961]
  }

  join: view_11963 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11959.category} = ${view_11963.category} ;;
  }

  access_filter: {
    field: view_11959.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11959.is_deleted} = false ;;
}
