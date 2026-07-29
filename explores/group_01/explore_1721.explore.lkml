# Explore: explore_1721
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05164.view.lkml"
include: "/views/domain_16/view_05166.view.lkml"
include: "/views/domain_17/view_05167.view.lkml"
include: "/views/domain_18/view_05168.view.lkml"

explore: explore_1721 {
  label: "Explore Explore 1721"
  description: "Comprehensive analytics explore joining base view_05164 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05164
  
  always_filter: {
    filters: [view_05164.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05164.created_at_date: "7 days"]
    unless: [view_05164.id, view_05164.status]
  }

  join: view_05166 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05164.user_id} = ${view_05166.id} ;;
    required_joins: []
  }

  join: view_05167 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05164.account_id} = ${view_05167.account_id} ;;
    required_joins: [view_05166]
  }

  join: view_05168 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05164.category} = ${view_05168.category} ;;
  }

  access_filter: {
    field: view_05164.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05164.is_deleted} = false ;;
}
