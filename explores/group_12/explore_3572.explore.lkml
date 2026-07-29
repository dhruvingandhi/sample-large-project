# Explore: explore_3572
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10717.view.lkml"
include: "/views/domain_19/view_10719.view.lkml"
include: "/views/domain_20/view_10720.view.lkml"
include: "/views/domain_21/view_10721.view.lkml"

explore: explore_3572 {
  label: "Explore Explore 3572"
  description: "Comprehensive analytics explore joining base view_10717 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10717
  
  always_filter: {
    filters: [view_10717.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10717.created_at_date: "7 days"]
    unless: [view_10717.id, view_10717.status]
  }

  join: view_10719 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10717.user_id} = ${view_10719.id} ;;
    required_joins: []
  }

  join: view_10720 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10717.account_id} = ${view_10720.account_id} ;;
    required_joins: [view_10719]
  }

  join: view_10721 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10717.category} = ${view_10721.category} ;;
  }

  access_filter: {
    field: view_10717.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10717.is_deleted} = false ;;
}
