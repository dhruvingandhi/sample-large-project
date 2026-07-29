# Explore: explore_2196
# Auto-generated LookML Explore File

include: "/views/domain_39/view_06589.view.lkml"
include: "/views/domain_41/view_06591.view.lkml"
include: "/views/domain_42/view_06592.view.lkml"
include: "/views/domain_43/view_06593.view.lkml"

explore: explore_2196 {
  label: "Explore Explore 2196"
  description: "Comprehensive analytics explore joining base view_06589 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06589
  
  always_filter: {
    filters: [view_06589.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06589.created_at_date: "7 days"]
    unless: [view_06589.id, view_06589.status]
  }

  join: view_06591 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06589.user_id} = ${view_06591.id} ;;
    required_joins: []
  }

  join: view_06592 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06589.account_id} = ${view_06592.account_id} ;;
    required_joins: [view_06591]
  }

  join: view_06593 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06589.category} = ${view_06593.category} ;;
  }

  access_filter: {
    field: view_06589.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06589.is_deleted} = false ;;
}
