# Explore: explore_2127
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06382.view.lkml"
include: "/views/domain_34/view_06384.view.lkml"
include: "/views/domain_35/view_06385.view.lkml"
include: "/views/domain_36/view_06386.view.lkml"

explore: explore_2127 {
  label: "Explore Explore 2127"
  description: "Comprehensive analytics explore joining base view_06382 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06382
  
  always_filter: {
    filters: [view_06382.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06382.created_at_date: "7 days"]
    unless: [view_06382.id, view_06382.status]
  }

  join: view_06384 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06382.user_id} = ${view_06384.id} ;;
    required_joins: []
  }

  join: view_06385 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06382.account_id} = ${view_06385.account_id} ;;
    required_joins: [view_06384]
  }

  join: view_06386 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06382.category} = ${view_06386.category} ;;
  }

  access_filter: {
    field: view_06382.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06382.is_deleted} = false ;;
}
