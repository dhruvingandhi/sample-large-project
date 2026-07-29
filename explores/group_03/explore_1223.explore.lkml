# Explore: explore_1223
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03670.view.lkml"
include: "/views/domain_22/view_03672.view.lkml"
include: "/views/domain_23/view_03673.view.lkml"
include: "/views/domain_24/view_03674.view.lkml"

explore: explore_1223 {
  label: "Explore Explore 1223"
  description: "Comprehensive analytics explore joining base view_03670 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03670
  
  always_filter: {
    filters: [view_03670.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03670.created_at_date: "7 days"]
    unless: [view_03670.id, view_03670.status]
  }

  join: view_03672 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03670.user_id} = ${view_03672.id} ;;
    required_joins: []
  }

  join: view_03673 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03670.account_id} = ${view_03673.account_id} ;;
    required_joins: [view_03672]
  }

  join: view_03674 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03670.category} = ${view_03674.category} ;;
  }

  access_filter: {
    field: view_03670.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03670.is_deleted} = false ;;
}
