# Explore: explore_1246
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03739.view.lkml"
include: "/views/domain_41/view_03741.view.lkml"
include: "/views/domain_42/view_03742.view.lkml"
include: "/views/domain_43/view_03743.view.lkml"

explore: explore_1246 {
  label: "Explore Explore 1246"
  description: "Comprehensive analytics explore joining base view_03739 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03739
  
  always_filter: {
    filters: [view_03739.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03739.created_at_date: "7 days"]
    unless: [view_03739.id, view_03739.status]
  }

  join: view_03741 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03739.user_id} = ${view_03741.id} ;;
    required_joins: []
  }

  join: view_03742 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03739.account_id} = ${view_03742.account_id} ;;
    required_joins: [view_03741]
  }

  join: view_03743 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03739.category} = ${view_03743.category} ;;
  }

  access_filter: {
    field: view_03739.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03739.is_deleted} = false ;;
}
