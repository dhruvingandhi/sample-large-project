# Explore: explore_0827
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02482.view.lkml"
include: "/views/domain_34/view_02484.view.lkml"
include: "/views/domain_35/view_02485.view.lkml"
include: "/views/domain_36/view_02486.view.lkml"

explore: explore_0827 {
  label: "Explore Explore 0827"
  description: "Comprehensive analytics explore joining base view_02482 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02482
  
  always_filter: {
    filters: [view_02482.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02482.created_at_date: "7 days"]
    unless: [view_02482.id, view_02482.status]
  }

  join: view_02484 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02482.user_id} = ${view_02484.id} ;;
    required_joins: []
  }

  join: view_02485 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02482.account_id} = ${view_02485.account_id} ;;
    required_joins: [view_02484]
  }

  join: view_02486 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02482.category} = ${view_02486.category} ;;
  }

  access_filter: {
    field: view_02482.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02482.is_deleted} = false ;;
}
