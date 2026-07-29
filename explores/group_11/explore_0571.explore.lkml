# Explore: explore_0571
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01714.view.lkml"
include: "/views/domain_16/view_01716.view.lkml"
include: "/views/domain_17/view_01717.view.lkml"
include: "/views/domain_18/view_01718.view.lkml"

explore: explore_0571 {
  label: "Explore Explore 0571"
  description: "Comprehensive analytics explore joining base view_01714 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01714
  
  always_filter: {
    filters: [view_01714.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01714.created_at_date: "7 days"]
    unless: [view_01714.id, view_01714.status]
  }

  join: view_01716 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01714.user_id} = ${view_01716.id} ;;
    required_joins: []
  }

  join: view_01717 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01714.account_id} = ${view_01717.account_id} ;;
    required_joins: [view_01716]
  }

  join: view_01718 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01714.category} = ${view_01718.category} ;;
  }

  access_filter: {
    field: view_01714.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01714.is_deleted} = false ;;
}
