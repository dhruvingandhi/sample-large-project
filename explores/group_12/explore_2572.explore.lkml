# Explore: explore_2572
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07717.view.lkml"
include: "/views/domain_19/view_07719.view.lkml"
include: "/views/domain_20/view_07720.view.lkml"
include: "/views/domain_21/view_07721.view.lkml"

explore: explore_2572 {
  label: "Explore Explore 2572"
  description: "Comprehensive analytics explore joining base view_07717 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07717
  
  always_filter: {
    filters: [view_07717.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07717.created_at_date: "7 days"]
    unless: [view_07717.id, view_07717.status]
  }

  join: view_07719 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07717.user_id} = ${view_07719.id} ;;
    required_joins: []
  }

  join: view_07720 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07717.account_id} = ${view_07720.account_id} ;;
    required_joins: [view_07719]
  }

  join: view_07721 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07717.category} = ${view_07721.category} ;;
  }

  access_filter: {
    field: view_07717.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07717.is_deleted} = false ;;
}
