# Explore: explore_2721
# Auto-generated LookML Explore File

include: "/views/domain_14/view_08164.view.lkml"
include: "/views/domain_16/view_08166.view.lkml"
include: "/views/domain_17/view_08167.view.lkml"
include: "/views/domain_18/view_08168.view.lkml"

explore: explore_2721 {
  label: "Explore Explore 2721"
  description: "Comprehensive analytics explore joining base view_08164 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08164
  
  always_filter: {
    filters: [view_08164.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08164.created_at_date: "7 days"]
    unless: [view_08164.id, view_08164.status]
  }

  join: view_08166 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08164.user_id} = ${view_08166.id} ;;
    required_joins: []
  }

  join: view_08167 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08164.account_id} = ${view_08167.account_id} ;;
    required_joins: [view_08166]
  }

  join: view_08168 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08164.category} = ${view_08168.category} ;;
  }

  access_filter: {
    field: view_08164.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08164.is_deleted} = false ;;
}
