# Explore: explore_2015
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06046.view.lkml"
include: "/views/domain_48/view_06048.view.lkml"
include: "/views/domain_49/view_06049.view.lkml"
include: "/views/domain_50/view_06050.view.lkml"

explore: explore_2015 {
  label: "Explore Explore 2015"
  description: "Comprehensive analytics explore joining base view_06046 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06046
  
  always_filter: {
    filters: [view_06046.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06046.created_at_date: "7 days"]
    unless: [view_06046.id, view_06046.status]
  }

  join: view_06048 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06046.user_id} = ${view_06048.id} ;;
    required_joins: []
  }

  join: view_06049 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06046.account_id} = ${view_06049.account_id} ;;
    required_joins: [view_06048]
  }

  join: view_06050 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06046.category} = ${view_06050.category} ;;
  }

  access_filter: {
    field: view_06046.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06046.is_deleted} = false ;;
}
