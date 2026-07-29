# Explore: explore_1012
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03037.view.lkml"
include: "/views/domain_39/view_03039.view.lkml"
include: "/views/domain_40/view_03040.view.lkml"
include: "/views/domain_41/view_03041.view.lkml"

explore: explore_1012 {
  label: "Explore Explore 1012"
  description: "Comprehensive analytics explore joining base view_03037 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03037
  
  always_filter: {
    filters: [view_03037.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03037.created_at_date: "7 days"]
    unless: [view_03037.id, view_03037.status]
  }

  join: view_03039 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03037.user_id} = ${view_03039.id} ;;
    required_joins: []
  }

  join: view_03040 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03037.account_id} = ${view_03040.account_id} ;;
    required_joins: [view_03039]
  }

  join: view_03041 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03037.category} = ${view_03041.category} ;;
  }

  access_filter: {
    field: view_03037.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03037.is_deleted} = false ;;
}
