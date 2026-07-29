# Explore: explore_2742
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08227.view.lkml"
include: "/views/domain_29/view_08229.view.lkml"
include: "/views/domain_30/view_08230.view.lkml"
include: "/views/domain_31/view_08231.view.lkml"

explore: explore_2742 {
  label: "Explore Explore 2742"
  description: "Comprehensive analytics explore joining base view_08227 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08227
  
  always_filter: {
    filters: [view_08227.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08227.created_at_date: "7 days"]
    unless: [view_08227.id, view_08227.status]
  }

  join: view_08229 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08227.user_id} = ${view_08229.id} ;;
    required_joins: []
  }

  join: view_08230 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08227.account_id} = ${view_08230.account_id} ;;
    required_joins: [view_08229]
  }

  join: view_08231 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08227.category} = ${view_08231.category} ;;
  }

  access_filter: {
    field: view_08227.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08227.is_deleted} = false ;;
}
