# Explore: explore_1048
# Auto-generated LookML Explore File

include: "/views/domain_45/view_03145.view.lkml"
include: "/views/domain_47/view_03147.view.lkml"
include: "/views/domain_48/view_03148.view.lkml"
include: "/views/domain_49/view_03149.view.lkml"

explore: explore_1048 {
  label: "Explore Explore 1048"
  description: "Comprehensive analytics explore joining base view_03145 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03145
  
  always_filter: {
    filters: [view_03145.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03145.created_at_date: "7 days"]
    unless: [view_03145.id, view_03145.status]
  }

  join: view_03147 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03145.user_id} = ${view_03147.id} ;;
    required_joins: []
  }

  join: view_03148 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03145.account_id} = ${view_03148.account_id} ;;
    required_joins: [view_03147]
  }

  join: view_03149 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03145.category} = ${view_03149.category} ;;
  }

  access_filter: {
    field: view_03145.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03145.is_deleted} = false ;;
}
