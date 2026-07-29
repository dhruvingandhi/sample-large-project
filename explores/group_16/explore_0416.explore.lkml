# Explore: explore_0416
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01249.view.lkml"
include: "/views/domain_01/view_01251.view.lkml"
include: "/views/domain_02/view_01252.view.lkml"
include: "/views/domain_03/view_01253.view.lkml"

explore: explore_0416 {
  label: "Explore Explore 0416"
  description: "Comprehensive analytics explore joining base view_01249 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01249
  
  always_filter: {
    filters: [view_01249.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01249.created_at_date: "7 days"]
    unless: [view_01249.id, view_01249.status]
  }

  join: view_01251 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01249.user_id} = ${view_01251.id} ;;
    required_joins: []
  }

  join: view_01252 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01249.account_id} = ${view_01252.account_id} ;;
    required_joins: [view_01251]
  }

  join: view_01253 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01249.category} = ${view_01253.category} ;;
  }

  access_filter: {
    field: view_01249.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01249.is_deleted} = false ;;
}
