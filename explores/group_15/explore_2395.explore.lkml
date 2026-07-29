# Explore: explore_2395
# Auto-generated LookML Explore File

include: "/views/domain_36/view_07186.view.lkml"
include: "/views/domain_38/view_07188.view.lkml"
include: "/views/domain_39/view_07189.view.lkml"
include: "/views/domain_40/view_07190.view.lkml"

explore: explore_2395 {
  label: "Explore Explore 2395"
  description: "Comprehensive analytics explore joining base view_07186 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07186
  
  always_filter: {
    filters: [view_07186.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07186.created_at_date: "7 days"]
    unless: [view_07186.id, view_07186.status]
  }

  join: view_07188 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07186.user_id} = ${view_07188.id} ;;
    required_joins: []
  }

  join: view_07189 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07186.account_id} = ${view_07189.account_id} ;;
    required_joins: [view_07188]
  }

  join: view_07190 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07186.category} = ${view_07190.category} ;;
  }

  access_filter: {
    field: view_07186.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07186.is_deleted} = false ;;
}
