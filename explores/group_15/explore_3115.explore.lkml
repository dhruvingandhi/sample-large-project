# Explore: explore_3115
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09346.view.lkml"
include: "/views/domain_48/view_09348.view.lkml"
include: "/views/domain_49/view_09349.view.lkml"
include: "/views/domain_50/view_09350.view.lkml"

explore: explore_3115 {
  label: "Explore Explore 3115"
  description: "Comprehensive analytics explore joining base view_09346 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09346
  
  always_filter: {
    filters: [view_09346.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09346.created_at_date: "7 days"]
    unless: [view_09346.id, view_09346.status]
  }

  join: view_09348 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09346.user_id} = ${view_09348.id} ;;
    required_joins: []
  }

  join: view_09349 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09346.account_id} = ${view_09349.account_id} ;;
    required_joins: [view_09348]
  }

  join: view_09350 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09346.category} = ${view_09350.category} ;;
  }

  access_filter: {
    field: view_09346.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09346.is_deleted} = false ;;
}
