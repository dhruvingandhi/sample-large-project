# Explore: explore_3906
# Auto-generated LookML Explore File

include: "/views/domain_19/view_11719.view.lkml"
include: "/views/domain_21/view_11721.view.lkml"
include: "/views/domain_22/view_11722.view.lkml"
include: "/views/domain_23/view_11723.view.lkml"

explore: explore_3906 {
  label: "Explore Explore 3906"
  description: "Comprehensive analytics explore joining base view_11719 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11719
  
  always_filter: {
    filters: [view_11719.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11719.created_at_date: "7 days"]
    unless: [view_11719.id, view_11719.status]
  }

  join: view_11721 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11719.user_id} = ${view_11721.id} ;;
    required_joins: []
  }

  join: view_11722 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11719.account_id} = ${view_11722.account_id} ;;
    required_joins: [view_11721]
  }

  join: view_11723 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11719.category} = ${view_11723.category} ;;
  }

  access_filter: {
    field: view_11719.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11719.is_deleted} = false ;;
}
