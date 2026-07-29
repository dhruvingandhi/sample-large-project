# Explore: explore_3280
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09841.view.lkml"
include: "/views/domain_43/view_09843.view.lkml"
include: "/views/domain_44/view_09844.view.lkml"
include: "/views/domain_45/view_09845.view.lkml"

explore: explore_3280 {
  label: "Explore Explore 3280"
  description: "Comprehensive analytics explore joining base view_09841 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09841
  
  always_filter: {
    filters: [view_09841.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09841.created_at_date: "7 days"]
    unless: [view_09841.id, view_09841.status]
  }

  join: view_09843 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09841.user_id} = ${view_09843.id} ;;
    required_joins: []
  }

  join: view_09844 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09841.account_id} = ${view_09844.account_id} ;;
    required_joins: [view_09843]
  }

  join: view_09845 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09841.category} = ${view_09845.category} ;;
  }

  access_filter: {
    field: view_09841.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09841.is_deleted} = false ;;
}
