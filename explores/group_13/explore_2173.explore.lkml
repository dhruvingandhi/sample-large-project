# Explore: explore_2173
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06520.view.lkml"
include: "/views/domain_22/view_06522.view.lkml"
include: "/views/domain_23/view_06523.view.lkml"
include: "/views/domain_24/view_06524.view.lkml"

explore: explore_2173 {
  label: "Explore Explore 2173"
  description: "Comprehensive analytics explore joining base view_06520 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06520
  
  always_filter: {
    filters: [view_06520.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06520.created_at_date: "7 days"]
    unless: [view_06520.id, view_06520.status]
  }

  join: view_06522 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06520.user_id} = ${view_06522.id} ;;
    required_joins: []
  }

  join: view_06523 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06520.account_id} = ${view_06523.account_id} ;;
    required_joins: [view_06522]
  }

  join: view_06524 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06520.category} = ${view_06524.category} ;;
  }

  access_filter: {
    field: view_06520.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06520.is_deleted} = false ;;
}
