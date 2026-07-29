# Explore: explore_3196
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09589.view.lkml"
include: "/views/domain_41/view_09591.view.lkml"
include: "/views/domain_42/view_09592.view.lkml"
include: "/views/domain_43/view_09593.view.lkml"

explore: explore_3196 {
  label: "Explore Explore 3196"
  description: "Comprehensive analytics explore joining base view_09589 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09589
  
  always_filter: {
    filters: [view_09589.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09589.created_at_date: "7 days"]
    unless: [view_09589.id, view_09589.status]
  }

  join: view_09591 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09589.user_id} = ${view_09591.id} ;;
    required_joins: []
  }

  join: view_09592 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09589.account_id} = ${view_09592.account_id} ;;
    required_joins: [view_09591]
  }

  join: view_09593 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09589.category} = ${view_09593.category} ;;
  }

  access_filter: {
    field: view_09589.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09589.is_deleted} = false ;;
}
