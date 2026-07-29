# Explore: explore_2784
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08353.view.lkml"
include: "/views/domain_05/view_08355.view.lkml"
include: "/views/domain_06/view_08356.view.lkml"
include: "/views/domain_07/view_08357.view.lkml"

explore: explore_2784 {
  label: "Explore Explore 2784"
  description: "Comprehensive analytics explore joining base view_08353 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08353
  
  always_filter: {
    filters: [view_08353.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08353.created_at_date: "7 days"]
    unless: [view_08353.id, view_08353.status]
  }

  join: view_08355 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08353.user_id} = ${view_08355.id} ;;
    required_joins: []
  }

  join: view_08356 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08353.account_id} = ${view_08356.account_id} ;;
    required_joins: [view_08355]
  }

  join: view_08357 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08353.category} = ${view_08357.category} ;;
  }

  access_filter: {
    field: view_08353.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08353.is_deleted} = false ;;
}
