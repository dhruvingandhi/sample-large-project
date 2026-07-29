# Explore: explore_2223
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06670.view.lkml"
include: "/views/domain_22/view_06672.view.lkml"
include: "/views/domain_23/view_06673.view.lkml"
include: "/views/domain_24/view_06674.view.lkml"

explore: explore_2223 {
  label: "Explore Explore 2223"
  description: "Comprehensive analytics explore joining base view_06670 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06670
  
  always_filter: {
    filters: [view_06670.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06670.created_at_date: "7 days"]
    unless: [view_06670.id, view_06670.status]
  }

  join: view_06672 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06670.user_id} = ${view_06672.id} ;;
    required_joins: []
  }

  join: view_06673 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06670.account_id} = ${view_06673.account_id} ;;
    required_joins: [view_06672]
  }

  join: view_06674 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06670.category} = ${view_06674.category} ;;
  }

  access_filter: {
    field: view_06670.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06670.is_deleted} = false ;;
}
