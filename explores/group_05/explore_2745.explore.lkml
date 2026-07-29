# Explore: explore_2745
# Auto-generated LookML Explore File

include: "/views/domain_36/view_08236.view.lkml"
include: "/views/domain_38/view_08238.view.lkml"
include: "/views/domain_39/view_08239.view.lkml"
include: "/views/domain_40/view_08240.view.lkml"

explore: explore_2745 {
  label: "Explore Explore 2745"
  description: "Comprehensive analytics explore joining base view_08236 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08236
  
  always_filter: {
    filters: [view_08236.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08236.created_at_date: "7 days"]
    unless: [view_08236.id, view_08236.status]
  }

  join: view_08238 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08236.user_id} = ${view_08238.id} ;;
    required_joins: []
  }

  join: view_08239 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08236.account_id} = ${view_08239.account_id} ;;
    required_joins: [view_08238]
  }

  join: view_08240 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08236.category} = ${view_08240.category} ;;
  }

  access_filter: {
    field: view_08236.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08236.is_deleted} = false ;;
}
