# Explore: explore_2741
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08224.view.lkml"
include: "/views/domain_26/view_08226.view.lkml"
include: "/views/domain_27/view_08227.view.lkml"
include: "/views/domain_28/view_08228.view.lkml"

explore: explore_2741 {
  label: "Explore Explore 2741"
  description: "Comprehensive analytics explore joining base view_08224 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08224
  
  always_filter: {
    filters: [view_08224.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08224.created_at_date: "7 days"]
    unless: [view_08224.id, view_08224.status]
  }

  join: view_08226 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08224.user_id} = ${view_08226.id} ;;
    required_joins: []
  }

  join: view_08227 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08224.account_id} = ${view_08227.account_id} ;;
    required_joins: [view_08226]
  }

  join: view_08228 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08224.category} = ${view_08228.category} ;;
  }

  access_filter: {
    field: view_08224.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08224.is_deleted} = false ;;
}
