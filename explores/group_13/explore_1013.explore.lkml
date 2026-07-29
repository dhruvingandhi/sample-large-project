# Explore: explore_1013
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03040.view.lkml"
include: "/views/domain_42/view_03042.view.lkml"
include: "/views/domain_43/view_03043.view.lkml"
include: "/views/domain_44/view_03044.view.lkml"

explore: explore_1013 {
  label: "Explore Explore 1013"
  description: "Comprehensive analytics explore joining base view_03040 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03040
  
  always_filter: {
    filters: [view_03040.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03040.created_at_date: "7 days"]
    unless: [view_03040.id, view_03040.status]
  }

  join: view_03042 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03040.user_id} = ${view_03042.id} ;;
    required_joins: []
  }

  join: view_03043 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03040.account_id} = ${view_03043.account_id} ;;
    required_joins: [view_03042]
  }

  join: view_03044 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03040.category} = ${view_03044.category} ;;
  }

  access_filter: {
    field: view_03040.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03040.is_deleted} = false ;;
}
