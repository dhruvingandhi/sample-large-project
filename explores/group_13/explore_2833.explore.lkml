# Explore: explore_2833
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08500.view.lkml"
include: "/views/domain_02/view_08502.view.lkml"
include: "/views/domain_03/view_08503.view.lkml"
include: "/views/domain_04/view_08504.view.lkml"

explore: explore_2833 {
  label: "Explore Explore 2833"
  description: "Comprehensive analytics explore joining base view_08500 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08500
  
  always_filter: {
    filters: [view_08500.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08500.created_at_date: "7 days"]
    unless: [view_08500.id, view_08500.status]
  }

  join: view_08502 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08500.user_id} = ${view_08502.id} ;;
    required_joins: []
  }

  join: view_08503 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08500.account_id} = ${view_08503.account_id} ;;
    required_joins: [view_08502]
  }

  join: view_08504 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08500.category} = ${view_08504.category} ;;
  }

  access_filter: {
    field: view_08500.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08500.is_deleted} = false ;;
}
