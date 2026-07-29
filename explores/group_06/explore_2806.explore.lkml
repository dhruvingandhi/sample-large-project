# Explore: explore_2806
# Auto-generated LookML Explore File

include: "/views/domain_19/view_08419.view.lkml"
include: "/views/domain_21/view_08421.view.lkml"
include: "/views/domain_22/view_08422.view.lkml"
include: "/views/domain_23/view_08423.view.lkml"

explore: explore_2806 {
  label: "Explore Explore 2806"
  description: "Comprehensive analytics explore joining base view_08419 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08419
  
  always_filter: {
    filters: [view_08419.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08419.created_at_date: "7 days"]
    unless: [view_08419.id, view_08419.status]
  }

  join: view_08421 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08419.user_id} = ${view_08421.id} ;;
    required_joins: []
  }

  join: view_08422 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08419.account_id} = ${view_08422.account_id} ;;
    required_joins: [view_08421]
  }

  join: view_08423 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08419.category} = ${view_08423.category} ;;
  }

  access_filter: {
    field: view_08419.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08419.is_deleted} = false ;;
}
