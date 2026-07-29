# Explore: explore_3820
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11461.view.lkml"
include: "/views/domain_13/view_11463.view.lkml"
include: "/views/domain_14/view_11464.view.lkml"
include: "/views/domain_15/view_11465.view.lkml"

explore: explore_3820 {
  label: "Explore Explore 3820"
  description: "Comprehensive analytics explore joining base view_11461 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11461
  
  always_filter: {
    filters: [view_11461.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11461.created_at_date: "7 days"]
    unless: [view_11461.id, view_11461.status]
  }

  join: view_11463 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11461.user_id} = ${view_11463.id} ;;
    required_joins: []
  }

  join: view_11464 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11461.account_id} = ${view_11464.account_id} ;;
    required_joins: [view_11463]
  }

  join: view_11465 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11461.category} = ${view_11465.category} ;;
  }

  access_filter: {
    field: view_11461.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11461.is_deleted} = false ;;
}
