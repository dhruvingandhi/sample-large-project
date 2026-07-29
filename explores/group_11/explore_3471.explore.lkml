# Explore: explore_3471
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10414.view.lkml"
include: "/views/domain_16/view_10416.view.lkml"
include: "/views/domain_17/view_10417.view.lkml"
include: "/views/domain_18/view_10418.view.lkml"

explore: explore_3471 {
  label: "Explore Explore 3471"
  description: "Comprehensive analytics explore joining base view_10414 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10414
  
  always_filter: {
    filters: [view_10414.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10414.created_at_date: "7 days"]
    unless: [view_10414.id, view_10414.status]
  }

  join: view_10416 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10414.user_id} = ${view_10416.id} ;;
    required_joins: []
  }

  join: view_10417 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10414.account_id} = ${view_10417.account_id} ;;
    required_joins: [view_10416]
  }

  join: view_10418 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10414.category} = ${view_10418.category} ;;
  }

  access_filter: {
    field: view_10414.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10414.is_deleted} = false ;;
}
