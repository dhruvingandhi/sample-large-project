# Explore: explore_0906
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02719.view.lkml"
include: "/views/domain_21/view_02721.view.lkml"
include: "/views/domain_22/view_02722.view.lkml"
include: "/views/domain_23/view_02723.view.lkml"

explore: explore_0906 {
  label: "Explore Explore 0906"
  description: "Comprehensive analytics explore joining base view_02719 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02719
  
  always_filter: {
    filters: [view_02719.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02719.created_at_date: "7 days"]
    unless: [view_02719.id, view_02719.status]
  }

  join: view_02721 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02719.user_id} = ${view_02721.id} ;;
    required_joins: []
  }

  join: view_02722 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02719.account_id} = ${view_02722.account_id} ;;
    required_joins: [view_02721]
  }

  join: view_02723 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02719.category} = ${view_02723.category} ;;
  }

  access_filter: {
    field: view_02719.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02719.is_deleted} = false ;;
}
