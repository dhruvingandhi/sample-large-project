# Explore: explore_2718
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08155.view.lkml"
include: "/views/domain_07/view_08157.view.lkml"
include: "/views/domain_08/view_08158.view.lkml"
include: "/views/domain_09/view_08159.view.lkml"

explore: explore_2718 {
  label: "Explore Explore 2718"
  description: "Comprehensive analytics explore joining base view_08155 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08155
  
  always_filter: {
    filters: [view_08155.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08155.created_at_date: "7 days"]
    unless: [view_08155.id, view_08155.status]
  }

  join: view_08157 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08155.user_id} = ${view_08157.id} ;;
    required_joins: []
  }

  join: view_08158 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08155.account_id} = ${view_08158.account_id} ;;
    required_joins: [view_08157]
  }

  join: view_08159 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08155.category} = ${view_08159.category} ;;
  }

  access_filter: {
    field: view_08155.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08155.is_deleted} = false ;;
}
