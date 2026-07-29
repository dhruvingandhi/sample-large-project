# Explore: explore_1761
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05284.view.lkml"
include: "/views/domain_36/view_05286.view.lkml"
include: "/views/domain_37/view_05287.view.lkml"
include: "/views/domain_38/view_05288.view.lkml"

explore: explore_1761 {
  label: "Explore Explore 1761"
  description: "Comprehensive analytics explore joining base view_05284 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05284
  
  always_filter: {
    filters: [view_05284.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05284.created_at_date: "7 days"]
    unless: [view_05284.id, view_05284.status]
  }

  join: view_05286 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05284.user_id} = ${view_05286.id} ;;
    required_joins: []
  }

  join: view_05287 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05284.account_id} = ${view_05287.account_id} ;;
    required_joins: [view_05286]
  }

  join: view_05288 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05284.category} = ${view_05288.category} ;;
  }

  access_filter: {
    field: view_05284.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05284.is_deleted} = false ;;
}
