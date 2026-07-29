# Explore: explore_3784
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11353.view.lkml"
include: "/views/domain_05/view_11355.view.lkml"
include: "/views/domain_06/view_11356.view.lkml"
include: "/views/domain_07/view_11357.view.lkml"

explore: explore_3784 {
  label: "Explore Explore 3784"
  description: "Comprehensive analytics explore joining base view_11353 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11353
  
  always_filter: {
    filters: [view_11353.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11353.created_at_date: "7 days"]
    unless: [view_11353.id, view_11353.status]
  }

  join: view_11355 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11353.user_id} = ${view_11355.id} ;;
    required_joins: []
  }

  join: view_11356 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11353.account_id} = ${view_11356.account_id} ;;
    required_joins: [view_11355]
  }

  join: view_11357 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11353.category} = ${view_11357.category} ;;
  }

  access_filter: {
    field: view_11353.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11353.is_deleted} = false ;;
}
