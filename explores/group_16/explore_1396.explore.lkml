# Explore: explore_1396
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04189.view.lkml"
include: "/views/domain_41/view_04191.view.lkml"
include: "/views/domain_42/view_04192.view.lkml"
include: "/views/domain_43/view_04193.view.lkml"

explore: explore_1396 {
  label: "Explore Explore 1396"
  description: "Comprehensive analytics explore joining base view_04189 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04189
  
  always_filter: {
    filters: [view_04189.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04189.created_at_date: "7 days"]
    unless: [view_04189.id, view_04189.status]
  }

  join: view_04191 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04189.user_id} = ${view_04191.id} ;;
    required_joins: []
  }

  join: view_04192 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04189.account_id} = ${view_04192.account_id} ;;
    required_joins: [view_04191]
  }

  join: view_04193 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04189.category} = ${view_04193.category} ;;
  }

  access_filter: {
    field: view_04189.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04189.is_deleted} = false ;;
}
