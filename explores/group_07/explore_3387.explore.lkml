# Explore: explore_3387
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10162.view.lkml"
include: "/views/domain_14/view_10164.view.lkml"
include: "/views/domain_15/view_10165.view.lkml"
include: "/views/domain_16/view_10166.view.lkml"

explore: explore_3387 {
  label: "Explore Explore 3387"
  description: "Comprehensive analytics explore joining base view_10162 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10162
  
  always_filter: {
    filters: [view_10162.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10162.created_at_date: "7 days"]
    unless: [view_10162.id, view_10162.status]
  }

  join: view_10164 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10162.user_id} = ${view_10164.id} ;;
    required_joins: []
  }

  join: view_10165 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10162.account_id} = ${view_10165.account_id} ;;
    required_joins: [view_10164]
  }

  join: view_10166 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10162.category} = ${view_10166.category} ;;
  }

  access_filter: {
    field: view_10162.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10162.is_deleted} = false ;;
}
