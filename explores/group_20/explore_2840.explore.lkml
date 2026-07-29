# Explore: explore_2840
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08521.view.lkml"
include: "/views/domain_23/view_08523.view.lkml"
include: "/views/domain_24/view_08524.view.lkml"
include: "/views/domain_25/view_08525.view.lkml"

explore: explore_2840 {
  label: "Explore Explore 2840"
  description: "Comprehensive analytics explore joining base view_08521 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08521
  
  always_filter: {
    filters: [view_08521.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08521.created_at_date: "7 days"]
    unless: [view_08521.id, view_08521.status]
  }

  join: view_08523 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08521.user_id} = ${view_08523.id} ;;
    required_joins: []
  }

  join: view_08524 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08521.account_id} = ${view_08524.account_id} ;;
    required_joins: [view_08523]
  }

  join: view_08525 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08521.category} = ${view_08525.category} ;;
  }

  access_filter: {
    field: view_08521.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08521.is_deleted} = false ;;
}
