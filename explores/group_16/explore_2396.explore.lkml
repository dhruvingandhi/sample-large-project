# Explore: explore_2396
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07189.view.lkml"
include: "/views/domain_41/view_07191.view.lkml"
include: "/views/domain_42/view_07192.view.lkml"
include: "/views/domain_43/view_07193.view.lkml"

explore: explore_2396 {
  label: "Explore Explore 2396"
  description: "Comprehensive analytics explore joining base view_07189 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07189
  
  always_filter: {
    filters: [view_07189.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07189.created_at_date: "7 days"]
    unless: [view_07189.id, view_07189.status]
  }

  join: view_07191 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07189.user_id} = ${view_07191.id} ;;
    required_joins: []
  }

  join: view_07192 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07189.account_id} = ${view_07192.account_id} ;;
    required_joins: [view_07191]
  }

  join: view_07193 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07189.category} = ${view_07193.category} ;;
  }

  access_filter: {
    field: view_07189.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07189.is_deleted} = false ;;
}
