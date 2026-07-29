# Explore: explore_1196
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03589.view.lkml"
include: "/views/domain_41/view_03591.view.lkml"
include: "/views/domain_42/view_03592.view.lkml"
include: "/views/domain_43/view_03593.view.lkml"

explore: explore_1196 {
  label: "Explore Explore 1196"
  description: "Comprehensive analytics explore joining base view_03589 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03589
  
  always_filter: {
    filters: [view_03589.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03589.created_at_date: "7 days"]
    unless: [view_03589.id, view_03589.status]
  }

  join: view_03591 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03589.user_id} = ${view_03591.id} ;;
    required_joins: []
  }

  join: view_03592 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03589.account_id} = ${view_03592.account_id} ;;
    required_joins: [view_03591]
  }

  join: view_03593 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03589.category} = ${view_03593.category} ;;
  }

  access_filter: {
    field: view_03589.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03589.is_deleted} = false ;;
}
