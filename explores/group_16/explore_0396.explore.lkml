# Explore: explore_0396
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01189.view.lkml"
include: "/views/domain_41/view_01191.view.lkml"
include: "/views/domain_42/view_01192.view.lkml"
include: "/views/domain_43/view_01193.view.lkml"

explore: explore_0396 {
  label: "Explore Explore 0396"
  description: "Comprehensive analytics explore joining base view_01189 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01189
  
  always_filter: {
    filters: [view_01189.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01189.created_at_date: "7 days"]
    unless: [view_01189.id, view_01189.status]
  }

  join: view_01191 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01189.user_id} = ${view_01191.id} ;;
    required_joins: []
  }

  join: view_01192 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01189.account_id} = ${view_01192.account_id} ;;
    required_joins: [view_01191]
  }

  join: view_01193 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01189.category} = ${view_01193.category} ;;
  }

  access_filter: {
    field: view_01189.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01189.is_deleted} = false ;;
}
