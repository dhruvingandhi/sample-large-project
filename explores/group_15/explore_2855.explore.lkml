# Explore: explore_2855
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08566.view.lkml"
include: "/views/domain_18/view_08568.view.lkml"
include: "/views/domain_19/view_08569.view.lkml"
include: "/views/domain_20/view_08570.view.lkml"

explore: explore_2855 {
  label: "Explore Explore 2855"
  description: "Comprehensive analytics explore joining base view_08566 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08566
  
  always_filter: {
    filters: [view_08566.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08566.created_at_date: "7 days"]
    unless: [view_08566.id, view_08566.status]
  }

  join: view_08568 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08566.user_id} = ${view_08568.id} ;;
    required_joins: []
  }

  join: view_08569 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08566.account_id} = ${view_08569.account_id} ;;
    required_joins: [view_08568]
  }

  join: view_08570 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08566.category} = ${view_08570.category} ;;
  }

  access_filter: {
    field: view_08566.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08566.is_deleted} = false ;;
}
