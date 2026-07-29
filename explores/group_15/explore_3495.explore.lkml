# Explore: explore_3495
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10486.view.lkml"
include: "/views/domain_38/view_10488.view.lkml"
include: "/views/domain_39/view_10489.view.lkml"
include: "/views/domain_40/view_10490.view.lkml"

explore: explore_3495 {
  label: "Explore Explore 3495"
  description: "Comprehensive analytics explore joining base view_10486 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10486
  
  always_filter: {
    filters: [view_10486.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10486.created_at_date: "7 days"]
    unless: [view_10486.id, view_10486.status]
  }

  join: view_10488 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10486.user_id} = ${view_10488.id} ;;
    required_joins: []
  }

  join: view_10489 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10486.account_id} = ${view_10489.account_id} ;;
    required_joins: [view_10488]
  }

  join: view_10490 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10486.category} = ${view_10490.category} ;;
  }

  access_filter: {
    field: view_10486.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10486.is_deleted} = false ;;
}
