# Explore: explore_2876
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08629.view.lkml"
include: "/views/domain_31/view_08631.view.lkml"
include: "/views/domain_32/view_08632.view.lkml"
include: "/views/domain_33/view_08633.view.lkml"

explore: explore_2876 {
  label: "Explore Explore 2876"
  description: "Comprehensive analytics explore joining base view_08629 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08629
  
  always_filter: {
    filters: [view_08629.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08629.created_at_date: "7 days"]
    unless: [view_08629.id, view_08629.status]
  }

  join: view_08631 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08629.user_id} = ${view_08631.id} ;;
    required_joins: []
  }

  join: view_08632 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08629.account_id} = ${view_08632.account_id} ;;
    required_joins: [view_08631]
  }

  join: view_08633 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08629.category} = ${view_08633.category} ;;
  }

  access_filter: {
    field: view_08629.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08629.is_deleted} = false ;;
}
