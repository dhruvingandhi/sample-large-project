# Explore: explore_0876
# Auto-generated LookML Explore File

include: "/views/domain_29/view_02629.view.lkml"
include: "/views/domain_31/view_02631.view.lkml"
include: "/views/domain_32/view_02632.view.lkml"
include: "/views/domain_33/view_02633.view.lkml"

explore: explore_0876 {
  label: "Explore Explore 0876"
  description: "Comprehensive analytics explore joining base view_02629 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_02629
  
  always_filter: {
    filters: [view_02629.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02629.created_at_date: "7 days"]
    unless: [view_02629.id, view_02629.status]
  }

  join: view_02631 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02629.user_id} = ${view_02631.id} ;;
    required_joins: []
  }

  join: view_02632 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02629.account_id} = ${view_02632.account_id} ;;
    required_joins: [view_02631]
  }

  join: view_02633 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02629.category} = ${view_02633.category} ;;
  }

  access_filter: {
    field: view_02629.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02629.is_deleted} = false ;;
}
