# Explore: explore_0458
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01375.view.lkml"
include: "/views/domain_27/view_01377.view.lkml"
include: "/views/domain_28/view_01378.view.lkml"
include: "/views/domain_29/view_01379.view.lkml"

explore: explore_0458 {
  label: "Explore Explore 0458"
  description: "Comprehensive analytics explore joining base view_01375 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01375
  
  always_filter: {
    filters: [view_01375.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01375.created_at_date: "7 days"]
    unless: [view_01375.id, view_01375.status]
  }

  join: view_01377 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01375.user_id} = ${view_01377.id} ;;
    required_joins: []
  }

  join: view_01378 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01375.account_id} = ${view_01378.account_id} ;;
    required_joins: [view_01377]
  }

  join: view_01379 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01375.category} = ${view_01379.category} ;;
  }

  access_filter: {
    field: view_01375.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01375.is_deleted} = false ;;
}
