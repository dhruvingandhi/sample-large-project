# Explore: explore_2148
# Auto-generated LookML Explore File

include: "/views/domain_45/view_06445.view.lkml"
include: "/views/domain_47/view_06447.view.lkml"
include: "/views/domain_48/view_06448.view.lkml"
include: "/views/domain_49/view_06449.view.lkml"

explore: explore_2148 {
  label: "Explore Explore 2148"
  description: "Comprehensive analytics explore joining base view_06445 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06445
  
  always_filter: {
    filters: [view_06445.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06445.created_at_date: "7 days"]
    unless: [view_06445.id, view_06445.status]
  }

  join: view_06447 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06445.user_id} = ${view_06447.id} ;;
    required_joins: []
  }

  join: view_06448 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06445.account_id} = ${view_06448.account_id} ;;
    required_joins: [view_06447]
  }

  join: view_06449 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06445.category} = ${view_06449.category} ;;
  }

  access_filter: {
    field: view_06445.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06445.is_deleted} = false ;;
}
