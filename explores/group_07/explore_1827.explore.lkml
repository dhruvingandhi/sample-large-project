# Explore: explore_1827
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05482.view.lkml"
include: "/views/domain_34/view_05484.view.lkml"
include: "/views/domain_35/view_05485.view.lkml"
include: "/views/domain_36/view_05486.view.lkml"

explore: explore_1827 {
  label: "Explore Explore 1827"
  description: "Comprehensive analytics explore joining base view_05482 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05482
  
  always_filter: {
    filters: [view_05482.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05482.created_at_date: "7 days"]
    unless: [view_05482.id, view_05482.status]
  }

  join: view_05484 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05482.user_id} = ${view_05484.id} ;;
    required_joins: []
  }

  join: view_05485 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05482.account_id} = ${view_05485.account_id} ;;
    required_joins: [view_05484]
  }

  join: view_05486 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05482.category} = ${view_05486.category} ;;
  }

  access_filter: {
    field: view_05482.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05482.is_deleted} = false ;;
}
