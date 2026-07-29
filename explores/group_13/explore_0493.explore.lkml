# Explore: explore_0493
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01480.view.lkml"
include: "/views/domain_32/view_01482.view.lkml"
include: "/views/domain_33/view_01483.view.lkml"
include: "/views/domain_34/view_01484.view.lkml"

explore: explore_0493 {
  label: "Explore Explore 0493"
  description: "Comprehensive analytics explore joining base view_01480 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01480
  
  always_filter: {
    filters: [view_01480.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01480.created_at_date: "7 days"]
    unless: [view_01480.id, view_01480.status]
  }

  join: view_01482 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01480.user_id} = ${view_01482.id} ;;
    required_joins: []
  }

  join: view_01483 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01480.account_id} = ${view_01483.account_id} ;;
    required_joins: [view_01482]
  }

  join: view_01484 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01480.category} = ${view_01484.category} ;;
  }

  access_filter: {
    field: view_01480.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01480.is_deleted} = false ;;
}
