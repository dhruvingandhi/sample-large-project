# Explore: explore_1416
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04249.view.lkml"
include: "/views/domain_01/view_04251.view.lkml"
include: "/views/domain_02/view_04252.view.lkml"
include: "/views/domain_03/view_04253.view.lkml"

explore: explore_1416 {
  label: "Explore Explore 1416"
  description: "Comprehensive analytics explore joining base view_04249 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04249
  
  always_filter: {
    filters: [view_04249.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04249.created_at_date: "7 days"]
    unless: [view_04249.id, view_04249.status]
  }

  join: view_04251 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04249.user_id} = ${view_04251.id} ;;
    required_joins: []
  }

  join: view_04252 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04249.account_id} = ${view_04252.account_id} ;;
    required_joins: [view_04251]
  }

  join: view_04253 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04249.category} = ${view_04253.category} ;;
  }

  access_filter: {
    field: view_04249.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04249.is_deleted} = false ;;
}
