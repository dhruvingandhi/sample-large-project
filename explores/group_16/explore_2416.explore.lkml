# Explore: explore_2416
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07249.view.lkml"
include: "/views/domain_01/view_07251.view.lkml"
include: "/views/domain_02/view_07252.view.lkml"
include: "/views/domain_03/view_07253.view.lkml"

explore: explore_2416 {
  label: "Explore Explore 2416"
  description: "Comprehensive analytics explore joining base view_07249 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07249
  
  always_filter: {
    filters: [view_07249.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07249.created_at_date: "7 days"]
    unless: [view_07249.id, view_07249.status]
  }

  join: view_07251 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07249.user_id} = ${view_07251.id} ;;
    required_joins: []
  }

  join: view_07252 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07249.account_id} = ${view_07252.account_id} ;;
    required_joins: [view_07251]
  }

  join: view_07253 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07249.category} = ${view_07253.category} ;;
  }

  access_filter: {
    field: view_07249.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07249.is_deleted} = false ;;
}
