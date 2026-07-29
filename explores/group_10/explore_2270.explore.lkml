# Explore: explore_2270
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06811.view.lkml"
include: "/views/domain_13/view_06813.view.lkml"
include: "/views/domain_14/view_06814.view.lkml"
include: "/views/domain_15/view_06815.view.lkml"

explore: explore_2270 {
  label: "Explore Explore 2270"
  description: "Comprehensive analytics explore joining base view_06811 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06811
  
  always_filter: {
    filters: [view_06811.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06811.created_at_date: "7 days"]
    unless: [view_06811.id, view_06811.status]
  }

  join: view_06813 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06811.user_id} = ${view_06813.id} ;;
    required_joins: []
  }

  join: view_06814 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06811.account_id} = ${view_06814.account_id} ;;
    required_joins: [view_06813]
  }

  join: view_06815 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06811.category} = ${view_06815.category} ;;
  }

  access_filter: {
    field: view_06811.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06811.is_deleted} = false ;;
}
