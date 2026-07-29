# Explore: explore_3268
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09805.view.lkml"
include: "/views/domain_07/view_09807.view.lkml"
include: "/views/domain_08/view_09808.view.lkml"
include: "/views/domain_09/view_09809.view.lkml"

explore: explore_3268 {
  label: "Explore Explore 3268"
  description: "Comprehensive analytics explore joining base view_09805 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09805
  
  always_filter: {
    filters: [view_09805.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09805.created_at_date: "7 days"]
    unless: [view_09805.id, view_09805.status]
  }

  join: view_09807 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09805.user_id} = ${view_09807.id} ;;
    required_joins: []
  }

  join: view_09808 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09805.account_id} = ${view_09808.account_id} ;;
    required_joins: [view_09807]
  }

  join: view_09809 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09805.category} = ${view_09809.category} ;;
  }

  access_filter: {
    field: view_09805.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09805.is_deleted} = false ;;
}
