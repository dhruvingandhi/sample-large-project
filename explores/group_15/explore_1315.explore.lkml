# Explore: explore_1315
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03946.view.lkml"
include: "/views/domain_48/view_03948.view.lkml"
include: "/views/domain_49/view_03949.view.lkml"
include: "/views/domain_50/view_03950.view.lkml"

explore: explore_1315 {
  label: "Explore Explore 1315"
  description: "Comprehensive analytics explore joining base view_03946 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03946
  
  always_filter: {
    filters: [view_03946.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03946.created_at_date: "7 days"]
    unless: [view_03946.id, view_03946.status]
  }

  join: view_03948 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03946.user_id} = ${view_03948.id} ;;
    required_joins: []
  }

  join: view_03949 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03946.account_id} = ${view_03949.account_id} ;;
    required_joins: [view_03948]
  }

  join: view_03950 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03946.category} = ${view_03950.category} ;;
  }

  access_filter: {
    field: view_03946.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03946.is_deleted} = false ;;
}
