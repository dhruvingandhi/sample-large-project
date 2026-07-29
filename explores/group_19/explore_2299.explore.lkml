# Explore: explore_2299
# Auto-generated LookML Explore File

include: "/views/domain_48/view_06898.view.lkml"
include: "/views/domain_50/view_06900.view.lkml"
include: "/views/domain_01/view_06901.view.lkml"
include: "/views/domain_02/view_06902.view.lkml"

explore: explore_2299 {
  label: "Explore Explore 2299"
  description: "Comprehensive analytics explore joining base view_06898 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06898
  
  always_filter: {
    filters: [view_06898.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06898.created_at_date: "7 days"]
    unless: [view_06898.id, view_06898.status]
  }

  join: view_06900 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06898.user_id} = ${view_06900.id} ;;
    required_joins: []
  }

  join: view_06901 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06898.account_id} = ${view_06901.account_id} ;;
    required_joins: [view_06900]
  }

  join: view_06902 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06898.category} = ${view_06902.category} ;;
  }

  access_filter: {
    field: view_06898.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06898.is_deleted} = false ;;
}
