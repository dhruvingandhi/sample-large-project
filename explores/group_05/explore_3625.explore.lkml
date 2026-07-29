# Explore: explore_3625
# Auto-generated LookML Explore File

include: "/views/domain_26/view_10876.view.lkml"
include: "/views/domain_28/view_10878.view.lkml"
include: "/views/domain_29/view_10879.view.lkml"
include: "/views/domain_30/view_10880.view.lkml"

explore: explore_3625 {
  label: "Explore Explore 3625"
  description: "Comprehensive analytics explore joining base view_10876 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10876
  
  always_filter: {
    filters: [view_10876.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10876.created_at_date: "7 days"]
    unless: [view_10876.id, view_10876.status]
  }

  join: view_10878 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10876.user_id} = ${view_10878.id} ;;
    required_joins: []
  }

  join: view_10879 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10876.account_id} = ${view_10879.account_id} ;;
    required_joins: [view_10878]
  }

  join: view_10880 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10876.category} = ${view_10880.category} ;;
  }

  access_filter: {
    field: view_10876.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10876.is_deleted} = false ;;
}
