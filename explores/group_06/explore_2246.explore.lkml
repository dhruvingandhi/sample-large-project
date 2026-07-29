# Explore: explore_2246
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06739.view.lkml"
include: "/views/domain_41/view_06741.view.lkml"
include: "/views/domain_42/view_06742.view.lkml"
include: "/views/domain_43/view_06743.view.lkml"

explore: explore_2246 {
  label: "Explore Explore 2246"
  description: "Comprehensive analytics explore joining base view_06739 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06739
  
  always_filter: {
    filters: [view_06739.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06739.created_at_date: "7 days"]
    unless: [view_06739.id, view_06739.status]
  }

  join: view_06741 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06739.user_id} = ${view_06741.id} ;;
    required_joins: []
  }

  join: view_06742 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06739.account_id} = ${view_06742.account_id} ;;
    required_joins: [view_06741]
  }

  join: view_06743 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06739.category} = ${view_06743.category} ;;
  }

  access_filter: {
    field: view_06739.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06739.is_deleted} = false ;;
}
