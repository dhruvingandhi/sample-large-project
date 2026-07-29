# Explore: explore_1069
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03208.view.lkml"
include: "/views/domain_10/view_03210.view.lkml"
include: "/views/domain_11/view_03211.view.lkml"
include: "/views/domain_12/view_03212.view.lkml"

explore: explore_1069 {
  label: "Explore Explore 1069"
  description: "Comprehensive analytics explore joining base view_03208 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03208
  
  always_filter: {
    filters: [view_03208.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03208.created_at_date: "7 days"]
    unless: [view_03208.id, view_03208.status]
  }

  join: view_03210 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03208.user_id} = ${view_03210.id} ;;
    required_joins: []
  }

  join: view_03211 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03208.account_id} = ${view_03211.account_id} ;;
    required_joins: [view_03210]
  }

  join: view_03212 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03208.category} = ${view_03212.category} ;;
  }

  access_filter: {
    field: view_03208.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03208.is_deleted} = false ;;
}
