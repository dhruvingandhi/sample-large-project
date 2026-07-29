# Explore: explore_1141
# Auto-generated LookML Explore File

include: "/views/domain_24/view_03424.view.lkml"
include: "/views/domain_26/view_03426.view.lkml"
include: "/views/domain_27/view_03427.view.lkml"
include: "/views/domain_28/view_03428.view.lkml"

explore: explore_1141 {
  label: "Explore Explore 1141"
  description: "Comprehensive analytics explore joining base view_03424 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03424
  
  always_filter: {
    filters: [view_03424.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03424.created_at_date: "7 days"]
    unless: [view_03424.id, view_03424.status]
  }

  join: view_03426 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03424.user_id} = ${view_03426.id} ;;
    required_joins: []
  }

  join: view_03427 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03424.account_id} = ${view_03427.account_id} ;;
    required_joins: [view_03426]
  }

  join: view_03428 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03424.category} = ${view_03428.category} ;;
  }

  access_filter: {
    field: view_03424.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03424.is_deleted} = false ;;
}
