# Explore: explore_0417
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01252.view.lkml"
include: "/views/domain_04/view_01254.view.lkml"
include: "/views/domain_05/view_01255.view.lkml"
include: "/views/domain_06/view_01256.view.lkml"

explore: explore_0417 {
  label: "Explore Explore 0417"
  description: "Comprehensive analytics explore joining base view_01252 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01252
  
  always_filter: {
    filters: [view_01252.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01252.created_at_date: "7 days"]
    unless: [view_01252.id, view_01252.status]
  }

  join: view_01254 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01252.user_id} = ${view_01254.id} ;;
    required_joins: []
  }

  join: view_01255 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01252.account_id} = ${view_01255.account_id} ;;
    required_joins: [view_01254]
  }

  join: view_01256 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01252.category} = ${view_01256.category} ;;
  }

  access_filter: {
    field: view_01252.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01252.is_deleted} = false ;;
}
