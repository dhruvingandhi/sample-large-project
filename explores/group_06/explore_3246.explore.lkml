# Explore: explore_3246
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09739.view.lkml"
include: "/views/domain_41/view_09741.view.lkml"
include: "/views/domain_42/view_09742.view.lkml"
include: "/views/domain_43/view_09743.view.lkml"

explore: explore_3246 {
  label: "Explore Explore 3246"
  description: "Comprehensive analytics explore joining base view_09739 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09739
  
  always_filter: {
    filters: [view_09739.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09739.created_at_date: "7 days"]
    unless: [view_09739.id, view_09739.status]
  }

  join: view_09741 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09739.user_id} = ${view_09741.id} ;;
    required_joins: []
  }

  join: view_09742 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09739.account_id} = ${view_09742.account_id} ;;
    required_joins: [view_09741]
  }

  join: view_09743 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09739.category} = ${view_09743.category} ;;
  }

  access_filter: {
    field: view_09739.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09739.is_deleted} = false ;;
}
