# Explore: explore_2832
# Auto-generated LookML Explore File

include: "/views/domain_47/view_08497.view.lkml"
include: "/views/domain_49/view_08499.view.lkml"
include: "/views/domain_50/view_08500.view.lkml"
include: "/views/domain_01/view_08501.view.lkml"

explore: explore_2832 {
  label: "Explore Explore 2832"
  description: "Comprehensive analytics explore joining base view_08497 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08497
  
  always_filter: {
    filters: [view_08497.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08497.created_at_date: "7 days"]
    unless: [view_08497.id, view_08497.status]
  }

  join: view_08499 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08497.user_id} = ${view_08499.id} ;;
    required_joins: []
  }

  join: view_08500 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08497.account_id} = ${view_08500.account_id} ;;
    required_joins: [view_08499]
  }

  join: view_08501 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08497.category} = ${view_08501.category} ;;
  }

  access_filter: {
    field: view_08497.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08497.is_deleted} = false ;;
}
