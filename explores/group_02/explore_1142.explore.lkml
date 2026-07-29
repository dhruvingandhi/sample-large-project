# Explore: explore_1142
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03427.view.lkml"
include: "/views/domain_29/view_03429.view.lkml"
include: "/views/domain_30/view_03430.view.lkml"
include: "/views/domain_31/view_03431.view.lkml"

explore: explore_1142 {
  label: "Explore Explore 1142"
  description: "Comprehensive analytics explore joining base view_03427 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03427
  
  always_filter: {
    filters: [view_03427.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03427.created_at_date: "7 days"]
    unless: [view_03427.id, view_03427.status]
  }

  join: view_03429 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03427.user_id} = ${view_03429.id} ;;
    required_joins: []
  }

  join: view_03430 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03427.account_id} = ${view_03430.account_id} ;;
    required_joins: [view_03429]
  }

  join: view_03431 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03427.category} = ${view_03431.category} ;;
  }

  access_filter: {
    field: view_03427.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03427.is_deleted} = false ;;
}
