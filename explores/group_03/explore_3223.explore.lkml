# Explore: explore_3223
# Auto-generated LookML Explore File

include: "/views/domain_20/view_09670.view.lkml"
include: "/views/domain_22/view_09672.view.lkml"
include: "/views/domain_23/view_09673.view.lkml"
include: "/views/domain_24/view_09674.view.lkml"

explore: explore_3223 {
  label: "Explore Explore 3223"
  description: "Comprehensive analytics explore joining base view_09670 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09670
  
  always_filter: {
    filters: [view_09670.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09670.created_at_date: "7 days"]
    unless: [view_09670.id, view_09670.status]
  }

  join: view_09672 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09670.user_id} = ${view_09672.id} ;;
    required_joins: []
  }

  join: view_09673 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09670.account_id} = ${view_09673.account_id} ;;
    required_joins: [view_09672]
  }

  join: view_09674 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09670.category} = ${view_09674.category} ;;
  }

  access_filter: {
    field: view_09670.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09670.is_deleted} = false ;;
}
