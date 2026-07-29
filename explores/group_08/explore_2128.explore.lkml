# Explore: explore_2128
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06385.view.lkml"
include: "/views/domain_37/view_06387.view.lkml"
include: "/views/domain_38/view_06388.view.lkml"
include: "/views/domain_39/view_06389.view.lkml"

explore: explore_2128 {
  label: "Explore Explore 2128"
  description: "Comprehensive analytics explore joining base view_06385 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06385
  
  always_filter: {
    filters: [view_06385.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06385.created_at_date: "7 days"]
    unless: [view_06385.id, view_06385.status]
  }

  join: view_06387 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06385.user_id} = ${view_06387.id} ;;
    required_joins: []
  }

  join: view_06388 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06385.account_id} = ${view_06388.account_id} ;;
    required_joins: [view_06387]
  }

  join: view_06389 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06385.category} = ${view_06389.category} ;;
  }

  access_filter: {
    field: view_06385.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06385.is_deleted} = false ;;
}
