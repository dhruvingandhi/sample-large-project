# Explore: explore_3561
# Auto-generated LookML Explore File

include: "/views/domain_34/view_10684.view.lkml"
include: "/views/domain_36/view_10686.view.lkml"
include: "/views/domain_37/view_10687.view.lkml"
include: "/views/domain_38/view_10688.view.lkml"

explore: explore_3561 {
  label: "Explore Explore 3561"
  description: "Comprehensive analytics explore joining base view_10684 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10684
  
  always_filter: {
    filters: [view_10684.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10684.created_at_date: "7 days"]
    unless: [view_10684.id, view_10684.status]
  }

  join: view_10686 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10684.user_id} = ${view_10686.id} ;;
    required_joins: []
  }

  join: view_10687 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10684.account_id} = ${view_10687.account_id} ;;
    required_joins: [view_10686]
  }

  join: view_10688 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10684.category} = ${view_10688.category} ;;
  }

  access_filter: {
    field: view_10684.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10684.is_deleted} = false ;;
}
