# Explore: explore_1876
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05629.view.lkml"
include: "/views/domain_31/view_05631.view.lkml"
include: "/views/domain_32/view_05632.view.lkml"
include: "/views/domain_33/view_05633.view.lkml"

explore: explore_1876 {
  label: "Explore Explore 1876"
  description: "Comprehensive analytics explore joining base view_05629 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05629
  
  always_filter: {
    filters: [view_05629.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05629.created_at_date: "7 days"]
    unless: [view_05629.id, view_05629.status]
  }

  join: view_05631 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05629.user_id} = ${view_05631.id} ;;
    required_joins: []
  }

  join: view_05632 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05629.account_id} = ${view_05632.account_id} ;;
    required_joins: [view_05631]
  }

  join: view_05633 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05629.category} = ${view_05633.category} ;;
  }

  access_filter: {
    field: view_05629.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05629.is_deleted} = false ;;
}
