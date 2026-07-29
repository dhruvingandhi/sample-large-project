# Explore: explore_0196
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00589.view.lkml"
include: "/views/domain_41/view_00591.view.lkml"
include: "/views/domain_42/view_00592.view.lkml"
include: "/views/domain_43/view_00593.view.lkml"

explore: explore_0196 {
  label: "Explore Explore 0196"
  description: "Comprehensive analytics explore joining base view_00589 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00589
  
  always_filter: {
    filters: [view_00589.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00589.created_at_date: "7 days"]
    unless: [view_00589.id, view_00589.status]
  }

  join: view_00591 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00589.user_id} = ${view_00591.id} ;;
    required_joins: []
  }

  join: view_00592 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00589.account_id} = ${view_00592.account_id} ;;
    required_joins: [view_00591]
  }

  join: view_00593 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00589.category} = ${view_00593.category} ;;
  }

  access_filter: {
    field: view_00589.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00589.is_deleted} = false ;;
}
